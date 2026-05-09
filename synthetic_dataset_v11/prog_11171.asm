; DESCRIPTION: Renders a orange box of size 27x74 starting at (197, 113).
; PLAN: r0=197(x), r1=113(y), r2=27(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 113
LDI r2, 27
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
