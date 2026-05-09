; DESCRIPTION: Renders a cyan line between points (42, 212) and (191, 146).
; PLAN: r0=42(x1), r1=212(y1), r2=191(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 212
LDI r2, 191
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
