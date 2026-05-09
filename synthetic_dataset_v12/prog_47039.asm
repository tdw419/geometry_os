; DESCRIPTION: Renders a red box of size 61x77 starting at (410, 103).
; PLAN: r0=410(x), r1=103(y), r2=61(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 103
LDI r2, 61
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
