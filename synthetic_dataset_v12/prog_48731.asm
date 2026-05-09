; DESCRIPTION: Draws a white rectangle at (410, 129) with width 80 and height 50.
; PLAN: r0=410(x), r1=129(y), r2=80(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 129
LDI r2, 80
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
