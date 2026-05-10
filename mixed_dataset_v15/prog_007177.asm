; DESCRIPTION: Places a red 27x28 rectangle at position (306, 156).
; PLAN: r0=306(x), r1=156(y), r2=27(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 156
LDI r2, 27
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
