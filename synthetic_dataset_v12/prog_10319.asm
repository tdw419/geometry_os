; DESCRIPTION: Renders a orange box of size 33x90 starting at (300, 164).
; PLAN: r0=300(x), r1=164(y), r2=33(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 164
LDI r2, 33
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
