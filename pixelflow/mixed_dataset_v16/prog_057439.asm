; DESCRIPTION: Composite: Places a orange 56x103 rectangle at position (231, 35) then Places a green dot at position (72, 118).
; PLAN: r0=231(x), r1=35(y), r2=56(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=118(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 231
LDI r1, 35
LDI r2, 56
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 118
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
