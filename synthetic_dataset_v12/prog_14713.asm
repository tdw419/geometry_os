; DESCRIPTION: Places a yellow 93x77 rectangle at position (410, 131).
; PLAN: r0=410(x), r1=131(y), r2=93(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 131
LDI r2, 93
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
