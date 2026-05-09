; DESCRIPTION: Renders a red box of size 13x16 starting at (197, 12).
; PLAN: r0=197(x), r1=12(y), r2=13(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 12
LDI r2, 13
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
