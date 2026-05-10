; DESCRIPTION: Places a magenta line segment connecting (286, 152) to (228, 242).
; PLAN: r0=286(x1), r1=152(y1), r2=228(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 152
LDI r2, 228
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
