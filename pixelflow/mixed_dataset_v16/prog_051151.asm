; DESCRIPTION: Renders a cyan line between points (42, 211) and (120, 103).
; PLAN: r0=42(x1), r1=211(y1), r2=120(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 211
LDI r2, 120
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
