; DESCRIPTION: Composite: Places a purple 33x115 rectangle at position (422, 135) then Places a purple dot at position (123, 174) then Renders a cyan disk with center (410, 39) and radius 33.
; PLAN: r0=422(x), r1=135(y), r2=33(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=174(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=410(x), r11=39(y), r12=33(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 422
LDI r1, 135
LDI r2, 33
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 174
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 410
LDI r11, 39
LDI r12, 33
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
