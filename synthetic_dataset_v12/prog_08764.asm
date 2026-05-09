; DESCRIPTION: Renders a orange box of size 36x82 starting at (268, 146).
; PLAN: r0=268(x), r1=146(y), r2=36(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 146
LDI r2, 36
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
