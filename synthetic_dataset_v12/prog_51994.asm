; DESCRIPTION: Renders a red box of size 27x16 starting at (275, 38).
; PLAN: r0=275(x), r1=38(y), r2=27(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 38
LDI r2, 27
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
