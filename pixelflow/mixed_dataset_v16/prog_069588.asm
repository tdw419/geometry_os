; DESCRIPTION: Composite: Places a black 39x53 rectangle at position (293, 69) then Places a orange dot at position (491, 21).
; PLAN: r0=293(x), r1=69(y), r2=39(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=491(x), r6=21(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 69
LDI r2, 39
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 21
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
