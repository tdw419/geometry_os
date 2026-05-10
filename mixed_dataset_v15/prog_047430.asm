; DESCRIPTION: Composite: Places a white dot at position (429, 87) then Renders a cyan disk with center (182, 90) and radius 12 then Places a yellow 73x64 rectangle at position (123, 34).
; PLAN: r0=429(x), r1=87(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=90(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x), r11=34(y), r12=73(width), r13=64(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 87
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 182
LDI r6, 90
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 34
LDI r12, 73
LDI r13, 64
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
