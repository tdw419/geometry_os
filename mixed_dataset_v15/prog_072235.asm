; DESCRIPTION: Renders a white box of size 46x39 starting at (46, 91).
; PLAN: r0=46(x), r1=91(y), r2=46(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 91
LDI r2, 46
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
