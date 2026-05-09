; DESCRIPTION: Renders a cyan line between points (346, 28) and (383, 187).
; PLAN: r0=346(x1), r1=28(y1), r2=383(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 28
LDI r2, 383
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
