; DESCRIPTION: Composite: Renders a red box of size 108x98 starting at (62, 48) then Places a cyan line segment connecting (380, 166) to (243, 148).
; PLAN: r0=62(x), r1=48(y), r2=108(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x1), r6=166(y1), r7=243(x2), r8=148(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 48
LDI r2, 108
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 166
LDI r7, 243
LDI r8, 148
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
