; DESCRIPTION: Renders a cyan line between points (228, 242) and (28, 52).
; PLAN: r0=228(x1), r1=242(y1), r2=28(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 242
LDI r2, 28
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
