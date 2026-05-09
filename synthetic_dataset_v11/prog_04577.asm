; DESCRIPTION: Renders a cyan line between points (42, 227) and (151, 213).
; PLAN: r0=42(x1), r1=227(y1), r2=151(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 227
LDI r2, 151
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
