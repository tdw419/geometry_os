; DESCRIPTION: Composite: Creates a cyan circular shape at (72, 77) with radius 60 then Places a green dot at position (485, 200) then Renders a cyan box of size 47x113 starting at (196, 62).
; PLAN: r0=72(x), r1=77(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=485(x), r6=200(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=196(x), r11=62(y), r12=47(width), r13=113(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 77
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 485
LDI r6, 200
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 196
LDI r11, 62
LDI r12, 47
LDI r13, 113
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
