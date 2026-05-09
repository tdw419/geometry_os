; DESCRIPTION: Places a magenta line segment connecting (215, 228) to (305, 203).
; PLAN: r0=215(x1), r1=228(y1), r2=305(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 228
LDI r2, 305
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
