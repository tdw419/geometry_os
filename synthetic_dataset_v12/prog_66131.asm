; DESCRIPTION: Renders a white box of size 46x47 starting at (294, 117).
; PLAN: r0=294(x), r1=117(y), r2=46(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 117
LDI r2, 46
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
