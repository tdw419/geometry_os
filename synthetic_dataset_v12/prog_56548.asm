; DESCRIPTION: Composite: Places a cyan circle of radius 13 at center (39, 69) then Renders a purple box of size 50x61 starting at (295, 178).
; PLAN: r0=39(x), r1=69(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=178(y), r7=50(width), r8=61(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 69
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 178
LDI r7, 50
LDI r8, 61
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
