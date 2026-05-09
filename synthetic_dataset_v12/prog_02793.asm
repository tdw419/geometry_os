; DESCRIPTION: Composite: Creates a cyan rectangular region at (92, 53) spanning 97 by 74 pixels then Renders a cyan disk with center (459, 129) and radius 40.
; PLAN: r0=92(x), r1=53(y), r2=97(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=129(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 92
LDI r1, 53
LDI r2, 97
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 129
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
