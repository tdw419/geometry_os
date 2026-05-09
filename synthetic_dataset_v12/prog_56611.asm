; DESCRIPTION: Places a red line segment connecting (272, 116) to (168, 27).
; PLAN: r0=272(x1), r1=116(y1), r2=168(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 116
LDI r2, 168
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
