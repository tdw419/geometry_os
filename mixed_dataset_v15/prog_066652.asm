; DESCRIPTION: Composite: Places a red 115x86 rectangle at position (169, 96) then Places a red dot at position (91, 133).
; PLAN: r0=169(x), r1=96(y), r2=115(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x), r6=133(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 96
LDI r2, 115
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 133
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
