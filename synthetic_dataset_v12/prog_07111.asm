; DESCRIPTION: Places a cyan line segment connecting (506, 228) to (174, 248).
; PLAN: r0=506(x1), r1=228(y1), r2=174(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 228
LDI r2, 174
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
