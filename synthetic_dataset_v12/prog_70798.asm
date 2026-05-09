; DESCRIPTION: Places a magenta line segment connecting (425, 27) to (294, 143).
; PLAN: r0=425(x1), r1=27(y1), r2=294(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 27
LDI r2, 294
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
