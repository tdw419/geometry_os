; DESCRIPTION: Renders a cyan line between points (128, 221) and (68, 209).
; PLAN: r0=128(x1), r1=221(y1), r2=68(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 221
LDI r2, 68
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
