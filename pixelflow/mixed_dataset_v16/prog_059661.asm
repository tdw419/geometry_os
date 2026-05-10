; DESCRIPTION: Composite: Renders a cyan disk with center (182, 214) and radius 29 then Places a orange 29x47 rectangle at position (29, 83).
; PLAN: r0=182(x), r1=214(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=83(y), r7=29(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 214
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 83
LDI r7, 29
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
