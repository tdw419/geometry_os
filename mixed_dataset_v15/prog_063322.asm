; DESCRIPTION: Renders a white box of size 101x44 starting at (214, 174).
; PLAN: r0=214(x), r1=174(y), r2=101(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 174
LDI r2, 101
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
