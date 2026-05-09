; DESCRIPTION: Renders a red box of size 57x82 starting at (39, 21).
; PLAN: r0=39(x), r1=21(y), r2=57(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 21
LDI r2, 57
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
