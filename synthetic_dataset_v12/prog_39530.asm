; DESCRIPTION: Draws a red rectangle at (410, 33) with width 57 and height 97.
; PLAN: r0=410(x), r1=33(y), r2=57(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 33
LDI r2, 57
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
