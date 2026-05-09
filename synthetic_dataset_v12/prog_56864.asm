; DESCRIPTION: Renders a red box of size 39x41 starting at (460, 173).
; PLAN: r0=460(x), r1=173(y), r2=39(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 173
LDI r2, 39
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
