; DESCRIPTION: Composite: Places a cyan line segment connecting (234, 168) to (275, 251) then Renders a white box of size 120x114 starting at (239, 67).
; PLAN: r0=234(x1), r1=168(y1), r2=275(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=67(y), r7=120(width), r8=114(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 168
LDI r2, 275
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 67
LDI r7, 120
LDI r8, 114
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
