; DESCRIPTION: Places a red 102x39 rectangle at position (410, 194).
; PLAN: r0=410(x), r1=194(y), r2=102(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 194
LDI r2, 102
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
