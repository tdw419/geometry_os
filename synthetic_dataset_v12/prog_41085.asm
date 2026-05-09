; DESCRIPTION: Renders a orange box of size 82x94 starting at (403, 48).
; PLAN: r0=403(x), r1=48(y), r2=82(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 48
LDI r2, 82
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
