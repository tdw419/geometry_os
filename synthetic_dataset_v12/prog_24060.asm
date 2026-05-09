; DESCRIPTION: Composite: Places a red 46x61 rectangle at position (161, 154) then Places a white dot at position (226, 29).
; PLAN: r0=161(x), r1=154(y), r2=46(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=29(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 154
LDI r2, 46
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 29
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
