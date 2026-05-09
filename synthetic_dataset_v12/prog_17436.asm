; DESCRIPTION: Renders a orange box of size 57x19 starting at (197, 48).
; PLAN: r0=197(x), r1=48(y), r2=57(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 48
LDI r2, 57
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
