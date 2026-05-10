; DESCRIPTION: Renders a cyan line segment connecting (297, 114) to (42, 103).
; PLAN: r0=297(x1), r1=114(y1), r2=42(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 114
LDI r2, 42
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
