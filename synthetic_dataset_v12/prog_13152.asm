; DESCRIPTION: Places a green 74x39 rectangle at position (391, 202).
; PLAN: r0=391(x), r1=202(y), r2=74(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 202
LDI r2, 74
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
