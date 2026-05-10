; DESCRIPTION: Creates a green filled rectangle of size 71x50 starting at (284, 40).
; PLAN: r0=284(x), r1=40(y), r2=71(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 40
LDI r2, 71
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
