; DESCRIPTION: Composite: Renders a orange disk with center (243, 52) and radius 50 then Places a orange 67x120 rectangle at position (211, 91) then Renders a cyan line between points (53, 28) and (272, 202).
; PLAN: r0=243(x), r1=52(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=91(y), r7=67(width), r8=120(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=53(x1), r11=28(y1), r12=272(x2), r13=202(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 52
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 91
LDI r7, 67
LDI r8, 120
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 28
LDI r12, 272
LDI r13, 202
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
