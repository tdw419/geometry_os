; DESCRIPTION: Draws a cyan line from (263, 177) to (485, 239).
; PLAN: r0=263(x1), r1=177(y1), r2=485(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 177
LDI r2, 485
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
