; DESCRIPTION: Renders a cyan line between points (497, 39) and (346, 0).
; PLAN: r0=497(x1), r1=39(y1), r2=346(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 39
LDI r2, 346
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
