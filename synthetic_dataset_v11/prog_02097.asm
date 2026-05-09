; DESCRIPTION: Renders a green box of size 47x33 starting at (69, 214).
; PLAN: r0=69(x), r1=214(y), r2=47(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 214
LDI r2, 47
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
