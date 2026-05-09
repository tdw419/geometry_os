; DESCRIPTION: Renders a cyan line between points (242, 54) and (156, 42).
; PLAN: r0=242(x1), r1=54(y1), r2=156(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 54
LDI r2, 156
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
