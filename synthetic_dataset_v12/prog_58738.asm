; DESCRIPTION: Composite: Places a blue circle of radius 47 at center (415, 70) then Creates a magenta rectangular region at (116, 129) spanning 113 by 54 pixels.
; PLAN: r0=415(x), r1=70(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=129(y), r7=113(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 70
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 129
LDI r7, 113
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
