; DESCRIPTION: Composite: Renders a blue disk with center (150, 208) and radius 18 then Creates a orange rectangular region at (305, 120) spanning 107 by 39 pixels.
; PLAN: r0=150(x), r1=208(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=120(y), r7=107(width), r8=39(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 208
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 120
LDI r7, 107
LDI r8, 39
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
