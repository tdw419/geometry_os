; DESCRIPTION: Composite: Places a cyan circle of radius 39 at center (187, 66) then Places a orange dot at position (214, 34) then Places a blue 116x53 rectangle at position (262, 92).
; PLAN: r0=187(x), r1=66(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=34(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=262(x), r11=92(y), r12=116(width), r13=53(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 66
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 34
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 262
LDI r11, 92
LDI r12, 116
LDI r13, 53
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
