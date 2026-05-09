; DESCRIPTION: Renders a cyan line between points (13, 117) and (228, 213).
; PLAN: r0=13(x1), r1=117(y1), r2=228(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 117
LDI r2, 228
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
