; DESCRIPTION: Renders a white box of size 21x23 starting at (482, 164).
; PLAN: r0=482(x), r1=164(y), r2=21(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 164
LDI r2, 21
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
