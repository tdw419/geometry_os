; DESCRIPTION: Renders a orange box of size 103x53 starting at (168, 117).
; PLAN: r0=168(x), r1=117(y), r2=103(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 117
LDI r2, 103
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
