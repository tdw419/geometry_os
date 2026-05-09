; DESCRIPTION: Draws a magenta line from (305, 239) to (482, 171).
; PLAN: r0=305(x1), r1=239(y1), r2=482(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 239
LDI r2, 482
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
