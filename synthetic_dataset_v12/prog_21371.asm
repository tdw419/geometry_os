; DESCRIPTION: Composite: Renders a cyan line between points (436, 116) and (125, 115) then Places a cyan 18x55 rectangle at position (99, 96).
; PLAN: r0=436(x1), r1=116(y1), r2=125(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=96(y), r7=18(width), r8=55(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 116
LDI r2, 125
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 96
LDI r7, 18
LDI r8, 55
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
